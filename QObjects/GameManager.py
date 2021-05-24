from PySide2.QtCore import QObject, Slot, Signal
from gameClasses.Game import Game
import listManager.SavesManager as listGetters


class GameManager(QObject):
    def __init__(self, game=None):
        self.game = game or Game()
        QObject.__init__(self)
        self.player1 = ''
        self.player2 = ''
        self.winner = ''

    changePlayers = Signal(int)

    getFirstPlayerMainScore = Signal(int)
    getFirstPlayerRoundScore = Signal(int)
    getFirstPlayerPartialScore1 = Signal(str)
    getFirstPlayerPartialScore2 = Signal(str)
    getFirstPlayerPartialScore3 = Signal(str)
    getFirstPlayerDoublesAndTriples = Signal(int, int)
    getFirstPlayerLegsAndSets = Signal(int, int)
    getFirstPlayerAverage = Signal(float)

    getSecondPlayerMainScore = Signal(int)
    getSecondPlayerRoundScore = Signal(int)
    getSecondPlayerPartialScore1 = Signal(str)
    getSecondPlayerPartialScore2 = Signal(str)
    getSecondPlayerPartialScore3 = Signal(str)
    getSecondPlayerDoublesAndTriples = Signal(int, int)
    getSecondPlayerLegsAndSets = Signal(int, int)
    getSecondPlayerAverage = Signal(float)

    changePlayerNames = Signal(str, str)
    endGame = Signal(str)
    undoLastThrow = Signal()
    finishAndSaveGame = Signal()

    @Slot(int)
    def onClickNumber(self, number):
        self.game.onClickNumber(number)
        self.updateFirstPlayerScore()
        self.updateSecondPlayerScore()
        self.checkForPlayerChange()
        self.checkForEndGame()

    @Slot()
    def onClickUndo(self):
        self.game.onClickUndo()
        self.updateFirstPlayerScore()
        self.updateSecondPlayerScore()
        self.checkForPlayerChange()

    @Slot()
    def onClickDouble(self):
        self.game.onClickDouble()

    @Slot()
    def onClickTriple(self):
        self.game.onClickTriple()

    @Slot(str, str, int, int, int)
    def onStartNewGame(self, player1, player2, numberOfLegs, numberOfSets, startScore):
        self.game = Game(numberOfLegs, numberOfSets, startScore)
        self.updateFirstPlayerScore()
        self.updateSecondPlayerScore()
        self.changePlayerNames.emit(player1, player2)
        self.checkForPlayerChange()
        self.player1 = player1
        self.player2 = player2

    @Slot()
    def onDialogUndo(self):
        self.onClickUndo()
        self.undoLastThrow.emit()

    @Slot()
    def onDialogEndGame(self):
        self.finishAndSaveGame.emit()
        self.saveGame()

    def updateFirstPlayerScore(self):
        player1 = self.game.player1
        self.getFirstPlayerMainScore.emit(player1.mainScore)
        self.getFirstPlayerRoundScore.emit(player1.roundScore)
        self.getFirstPlayerPartialScore1.emit(player1.partialScore[0])
        self.getFirstPlayerPartialScore2.emit(player1.partialScore[1])
        self.getFirstPlayerPartialScore3.emit(player1.partialScore[2])
        self.getFirstPlayerDoublesAndTriples.emit(player1.doubles, player1.triples)
        self.getFirstPlayerLegsAndSets.emit(player1.legs, player1.sets)
        self.getFirstPlayerAverage.emit(player1.average)

    def updateSecondPlayerScore(self):
        player2 = self.game.player2
        self.getSecondPlayerMainScore.emit(player2.mainScore)
        self.getSecondPlayerRoundScore.emit(player2.roundScore)
        self.getSecondPlayerPartialScore1.emit(player2.partialScore[0])
        self.getSecondPlayerPartialScore2.emit(player2.partialScore[1])
        self.getSecondPlayerPartialScore3.emit(player2.partialScore[2])
        self.getSecondPlayerDoublesAndTriples.emit(player2.doubles, player2.triples)
        self.getSecondPlayerLegsAndSets.emit(player2.legs, player2.sets)
        self.getSecondPlayerAverage.emit(player2.average)

    def checkForPlayerChange(self):
        if self.game.playerTurn == 1:
            self.changePlayers.emit(1)
        else:
            self.changePlayers.emit(2)

    def checkForEndGame(self):
        if self.game.player1.sets == self.game.numberOfSets // 2 + 1:
            self.winner = self.player1
            self.endGame.emit(self.winner)
        if self.game.player2.sets == self.game.numberOfSets // 2 + 1:
            self.winner = self.player2
            self.endGame.emit(self.winner)

    def saveGame(self):
        listGetters.saveGame(self.game, self.winner, self.player1, self.player2)
