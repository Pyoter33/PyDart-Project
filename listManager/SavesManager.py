from gameClasses.SavedPlayer import SavedPlayer
from PySide2 import QtCore
import threading


class SavesManager(QtCore.QObject):
    listReady = QtCore.Signal()

    def __init__(self):
        QtCore.QObject.__init__(self)
        self.playersList = []

    def getPlayersList(self):
        thread = threading.Thread(target=self.getPlayersListNewThread)
        thread.start()

    def getPlayersListNewThread(self):
        localList = []
        file = open("listManager\\playersList.txt", "r")
        line = file.readline()
        while line != '':
            wordList = line.split(' ')
            localList.append(SavedPlayer(wordList[0], int(wordList[1]), int(wordList[2]),
                                         int(wordList[3]), int(wordList[4]), int(wordList[5])))
            line = file.readline()
        file.close()
        self.playersList = localList
        self.listReady.emit()

    def sortListByNames(self):
        thread = threading.Thread(target=self.sortListByNamesNewThread)
        thread.start()

    def sortListByNamesNewThread(self):
        self.playersList.sort(key=lambda x: x.name)
        self.listReady.emit()

    def sortListByWonGames(self):
        thread = threading.Thread(target=self.sortListByWonGamesNewThread)
        thread.start()

    def sortListByWonGamesNewThread(self):
        self.playersList.sort(key=lambda x: x.gamesWon, reverse=True)
        self.listReady.emit()

    def sortListByWonLegs(self):
        thread = threading.Thread(target=self.sortListByWonLegsNewThread)
        thread.start()

    def sortListByWonLegsNewThread(self):
        self.playersList.sort(key=lambda x: x.legsWon, reverse=True)
        self.listReady.emit()

    def sortListByPointsDiff(self):
        thread = threading.Thread(target=self.sortListByPointsDiffNewThread)
        thread.start()

    def sortListByPointsDiffNewThread(self):
        self.playersList.sort(key=lambda x: x.pointsDiff, reverse=True)
        self.listReady.emit()


def saveGame(game, winner, player1Name, player2Name):
    thread = threading.Thread(target=saveGameNewThread, args=(game, winner, player1Name, player2Name))
    thread.start()


def saveGameNewThread(game, winner, player1Name, player2Name):
    file = open("listManager\\playersList.txt", "r")
    line = file.readline()
    newList = []

    while line != '':
        line.strip('\n')
        wordList = line.split(' ')

        if wordList[0] == player1Name:
            if player1Name == winner:
                updateWinner(game.player1, game.player2, wordList)
            else:
                updateLoser(game.player1, game.player2, wordList)

        if wordList[0] == player2Name:
            if player2Name == winner:
                updateWinner(game.player2, game.player1, wordList)
            else:
                updateLoser(game.player2, game.player1, wordList)

        element = f'{wordList[0]} {wordList[1]} {wordList[2]} {wordList[3]} {wordList[4]} {int(wordList[5])}'
        newList.append(element)
        line = file.readline()
    file.close()
    newFile = open("listManager\\playersList.txt", "w")

    for i in range(len(newList)):
        if i == 0:
            newFile.write(newList[i])
        else:
            newFile.write('\n' + newList[i])

    newFile.close()


def updateWinner(player, opponent, wordList):
    wordList[1] = int(wordList[1]) + 1
    wordList[3] = int(wordList[3]) + player.wonLegs
    wordList[4] = int(wordList[4]) + opponent.wonLegs
    wordList[5] = int(wordList[5]) + player.allScoresSum - opponent.allScoresSum


def updateLoser(player, opponent, wordList):
    wordList[2] = int(wordList[2]) + 1
    wordList[3] = int(wordList[3]) + player.wonLegs
    wordList[4] = int(wordList[4]) + opponent.wonLegs
    wordList[5] = int(wordList[5]) + player.allScoresSum - opponent.allScoresSum


def addPlayer(playerName):
    thread = threading.Thread(target=addPlayerNewThread, args=(playerName,))
    thread.start()


def addPlayerNewThread(playerName):
    file = open("listManager\\playersList.txt", "r")
    lines = file.readlines()
    file.close()
    file = open("listManager\\playersList.txt", "w")
    for line in lines:
        file.write(line)
    file.write(f'\n')
    file.write(f'{playerName} 0 0 0 0 0')
    file.close()


def deletePlayer(playerName):
    thread = threading.Thread(target=deletePlayerNewThread, args=(playerName,))
    thread.start()


def deletePlayerNewThread(playerName):
    file = open("listManager\\playersList.txt", "r")
    lines = file.readlines()
    file.close()
    file = open("listManager\\playersList.txt", "w")
    newLines = []
    for line in lines:
        if not line.split(' ')[0] == playerName:
            newLines.append(line)

    if lines[-1] != newLines[-1]:
        newLines[len(newLines) - 1] = newLines[len(newLines) - 1][:-1]

    for line in newLines:
        file.write(line)
    file.close()
