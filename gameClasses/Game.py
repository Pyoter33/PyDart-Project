from gameClasses.Player import Player


class Game:
    def __init__(self, numberOfLegs=3, numberOfSets=1, startScore=301):
        self.startScore = startScore
        self.numberOfSets = numberOfSets
        self.numberOfLegs = numberOfLegs
        self.whoStartsSet = 1
        self.whoStartsLeg = 1
        self.isTripleEnabled = False
        self.isDoubleEnabled = False
        self.playerTurn = 1
        self.player2 = Player(startScore)
        self.player1 = Player(startScore)

    def onClickNumber(self, value):
        if self.playerTurn == 1:
            self.countScore(value, self.player1)
        else:
            self.countScore(value, self.player2)

    def onClickDouble(self):
        if not self.isDoubleEnabled:
            self.isDoubleEnabled = True
            self.isTripleEnabled = False
        else:
            self.isDoubleEnabled = False

    def onClickTriple(self):
        if not self.isTripleEnabled:
            self.isTripleEnabled = True
            self.isDoubleEnabled = False
        else:
            self.isTripleEnabled = False

    def onClickUndo(self):
        if self.player1.mainScore == self.startScore and self.player2.mainScore == self.startScore and \
                self.player1.allScores and self.player2.allScores and (
                self.player1.allScores[-1][0] != 0 or self.player2.allScores[-1][0] != 0):

            if self.player1.mainScoreStack and self.player1.mainScoreStack[-1] \
                    == 0 and self.player1.currentPartialScore == 0:
                self.undoLeg(self.player1, self.player2, 1)

            if self.player2.mainScoreStack and self.player2.mainScoreStack[-1] \
                    == 0 and self.player2.currentPartialScore == 0:
                self.undoLeg(self.player2, self.player1, 2)
            return

        if self.playerTurn == 1:
            if self.player1.currentPartialScore == 0:
                if self.player2.allScores:
                    self.undoAndRecover(self.player2, self.player1, 2)
            else:
                if self.player1.allScores:
                    self.undo(self.player1)
            return

        if self.playerTurn == 2:
            if self.player2.currentPartialScore == 0:
                if self.player1.allScores:
                    self.undoAndRecover(self.player1, self.player2, 1)
            else:
                if self.player2.allScores:
                    self.undo(self.player2)
            return

    def countScore(self, value, player):
        mutValue = value
        if self.isDoubleEnabled:
            mutValue *= 2
            player.doubles += 1
            player.allScores.append((mutValue, True, False))
            player.partialScore[player.currentPartialScore] = f'D{value}'
        elif self.isTripleEnabled:
            mutValue *= 3
            player.triples += 1
            player.allScores.append((mutValue, False, True))
            player.partialScore[player.currentPartialScore] = f'T{value}'
        else:
            player.allScores.append((value, False, False))
            player.partialScore[player.currentPartialScore] = f'{value}'

        if player.roundScore == -1:
            player.roundScore += mutValue + 1
        else:
            player.roundScore += mutValue

        player.allScoresSum += mutValue
        player.mainScore -= mutValue

        self.isDoubleEnabled = False
        self.isTripleEnabled = False
        self.countAverage(player)
        self.checkForWin(player)

    def countAverage(self, player):
        if len(player.allScores) < 3:
            player.average = -1.0
        else:
            currentAverage = player.allScoresSum / (len(player.allScores) // 3)
            player.average = round(currentAverage, 2)

    def checkForWin(self, player):
        if player.mainScore == 0:
            if player.allScores[-1][1]:
                self.updateLegs(player)
            else:
                self.addOverthrow(player)
        elif player.mainScore < 0:
            self.addOverthrow(player)
        else:
            self.checkForPlayerChange(player)

    def undo(self, player):
        removedElement = player.allScores.pop()
        player.currentPartialScore -= 1
        if removedElement[0] == -1:
            self.undoOverthrow(player)
        else:
            self.undoNumber(player, removedElement)

        self.countAverage(player)

    def undoNumber(self, player, removedElement):
        player.mainScore += removedElement[0]
        player.roundScore -= removedElement[0]
        player.partialScore[player.currentPartialScore] = ' '
        player.allScoresSum -= removedElement[0]

        if player.currentPartialScore == 0:
            player.roundScore = -1

        if removedElement[1]:
            player.doubles -= 1

        if removedElement[2]:
            player.triples -= 1

    def undoOverthrow(self, player):
        player.partialScore[player.currentPartialScore] = ' '
        oldRoundScore = 0

        for i in range(1, player.currentPartialScore):
            elem = player.allScores[len(player.allScores) - i]
            oldRoundScore += elem[0]

            if elem[1]:
                player.doubles += 1
            if elem[2]:
                player.triples += 1

        player.mainScore -= oldRoundScore
        player.roundScore = oldRoundScore
        player.allScoresSum += oldRoundScore

    def undoAndRecover(self, player, playerToRecover, changeToTurn):
        if playerToRecover.mainScore != self.startScore or (
                playerToRecover.mainScore == self.startScore and playerToRecover.allScores and
                playerToRecover.allScores[-1][0] == 0):
            self.recoverPartialScore(playerToRecover)
            playerToRecover.roundScore = playerToRecover.roundScoreStack[-1]
            playerToRecover.mainScore = playerToRecover.mainScoreStack[-1]

        self.playerTurn = changeToTurn
        player.roundScore = player.roundScoreStack.pop()
        player.mainScore = player.mainScoreStack.pop()
        player.currentPartialScore = player.partialScoreStack.pop()
        self.undo(player)

    def undoLeg(self, player, playerToRecover, changeToTurn):
        if self.whoStartsLeg == 1:
            self.whoStartsLeg = 2
        else:
            self.whoStartsLeg = 1

        if player.legs == 0:

            if player.sets != 0:
                player.sets -= 1

            if self.whoStartsSet == 1:
                self.whoStartsSet = 2
            else:
                self.whoStartsSet = 1

        self.playerTurn = changeToTurn

        self.recoverPartialScore(player)
        player.roundScore = player.roundScoreStack.pop()
        player.mainScore = player.mainScoreStack.pop()
        player.currentPartialScore = player.partialScoreStack.pop()
        player.legs = player.legsStack.pop()
        self.undo(player)

        self.recoverPartialScore(playerToRecover)
        playerToRecover.roundScore = playerToRecover.roundScoreStack[-1]
        playerToRecover.mainScore = playerToRecover.mainScoreStack[-1]

    def recoverPartialScore(self, playerToRecover):

        for i in range(1, playerToRecover.partialScoreStack[-1] + 1):
            elem = playerToRecover.allScores[len(playerToRecover.allScores) - i]
            if elem[0] == -1:
                playerToRecover.partialScore[playerToRecover.partialScoreStack[-1] - i] = 'OT'
            else:
                if elem[1]:
                    playerToRecover.partialScore[playerToRecover.partialScoreStack[-1] - i] = f'D{elem[0] // 2}'
                elif elem[2]:
                    playerToRecover.partialScore[playerToRecover.partialScoreStack[-1] - i] = f'T{elem[0] // 3}'
                else:
                    playerToRecover.partialScore[playerToRecover.partialScoreStack[-1] - i] = str(elem[0])

    def updateLegs(self, player):
        player.partialScoreStack.append(player.currentPartialScore + 1)
        player.roundScoreStack.append(player.roundScore)
        player.mainScoreStack.append(player.mainScore)

        player.legsStack.append(player.legs)
        player.legs += 1
        self.resetScores(self.player1)
        self.resetScores(self.player2)
        player.wonLegs += 1

        if player.legs == self.numberOfLegs // 2 + 1:
            self.updateSets(player)
            return
        self.changeTurnLegs()

    def updateSets(self, player):
        player.sets += 1
        self.player1.legs = 0
        self.player2.legs = 0
        self.changeTurnSets()

        self.whoStartsLeg = self.whoStartsSet

    def checkForPlayerChange(self, player):
        if player.currentPartialScore == 2:
            player.partialScoreStack.append(player.currentPartialScore + 1)
            player.roundScoreStack.append(player.roundScore)
            player.mainScoreStack.append(player.mainScore)
            self.changePlayer()
        else:
            player.currentPartialScore += 1

    def changePlayer(self):
        if self.playerTurn == 1:
            self.changeChosenPlayer(self.player2, 2)
        else:
            self.changeChosenPlayer(self.player1, 1)

    def changeChosenPlayer(self, player, changeToTurn):
        player.currentPartialScore = 0
        player.roundScore = -1
        self.playerTurn = changeToTurn

        for i in range(0, len(player.partialScore)):
            player.partialScore[i] = ' '

    def resetScores(self, player):
        player.mainScore = self.startScore
        for i in range(0, len(player.partialScore)):
            player.partialScore[i] = ' '
        player.roundScore = -1
        player.currentPartialScore = 0

    def addOverthrow(self, player):
        player.allScores[-1] = (-1, player.allScores[-1][1], player.allScores[-1][2])
        player.allScoresSum -= player.roundScore
        player.mainScore = player.mainScore + player.roundScore
        player.roundScore = 0
        player.partialScore[player.currentPartialScore] = 'OT'

        for i in range(1, player.currentPartialScore + 1):
            if player.allScores[-1][1]:
                player.doubles -= 1
            if player.allScores[-1][2]:
                player.triples -= 1

        player.partialScoreStack.append(player.currentPartialScore + 1)
        player.roundScoreStack.append(player.roundScore)
        player.mainScoreStack.append(player.mainScore)

        self.countAverage(player)
        self.changePlayer()

    def changeTurnLegs(self):
        if self.whoStartsLeg == 1:
            self.playerTurn = 2
            self.whoStartsLeg = 2
        else:
            self.playerTurn = 1
            self.whoStartsLeg = 1

    def changeTurnSets(self):
        if self.whoStartsSet == 1:
            self.playerTurn = 2
            self.whoStartsSet = 2
        else:
            self.playerTurn = 1
            self.whoStartsSet = 1
