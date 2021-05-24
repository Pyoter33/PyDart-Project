from listManager.PlayersListModel import *
from listManager.SavesManager import SavesManager
from listManager import SavesManager as sm


class ListManager(QtCore.QObject):
    startGame = QtCore.Signal()

    def __init__(self, parent=None):
        super(ListManager, self).__init__(parent)
        self.players = []
        self._model = PlayersListModel(self.players)
        self.listGetters = SavesManager()
        self.listGetters.listReady.connect(self.onUpdateList)
        self.onGetPlayersList()

    @QtCore.Slot()
    def onUpdateList(self):
        updatedList = self.listGetters.playersList
        self.model.setNewList(updatedList)

    @QtCore.Slot()
    def onGetPlayersList(self):
        self.listGetters.getPlayersList()

    @QtCore.Slot()
    def onGetListNames(self):
        self.listGetters.sortListByNames()

    @QtCore.Slot()
    def onGetListGamesWon(self):
        self.listGetters.sortListByWonGames()

    @QtCore.Slot()
    def onGetListLegsWon(self):
        self.listGetters.sortListByWonLegs()

    @QtCore.Slot()
    def onGetListPointsDiff(self):
        self.listGetters.sortListByPointsDiff()

    @QtCore.Slot(str, str)
    def checkIfPlayersAreValid(self, player1, player2):
        if player1 or player2:
            if player1 != player2:
                self.startGame.emit()

    @QtCore.Slot(str)
    def addNewPlayer(self, newPlayerName):
        sm.addPlayer(newPlayerName)

    @QtCore.Slot(str)
    def deletePlayer(self, newPlayerName):
        sm.deletePlayer(newPlayerName)

    def model(self):
        return self._model

    model = QtCore.Property(QtCore.QObject, fget=model, constant=True)
