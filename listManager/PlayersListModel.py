from PySide2 import QtCore


class PlayersListModel(QtCore.QAbstractListModel):
    NameRole = QtCore.Qt.UserRole + 1
    GamesWonRole = QtCore.Qt.UserRole + 2
    GamesLostRole = QtCore.Qt.UserRole + 3
    LegsWonRole = QtCore.Qt.UserRole + 4
    LegsLostRole = QtCore.Qt.UserRole + 5
    PointsDiffRole = QtCore.Qt.UserRole + 6

    def __init__(self, players=None, parent=None):
        super(PlayersListModel, self).__init__(parent)
        if players is None:
            players = []
        self._players = players

    def data(self, index, role=QtCore.Qt.DisplayRole):
        if 0 <= index.row() < self.rowCount() and index.isValid():
            item = self._players[index.row()]
            if role == PlayersListModel.NameRole:
                return item.name
            if role == PlayersListModel.GamesWonRole:
                return item.gamesWon
            if role == PlayersListModel.GamesLostRole:
                return item.gamesLost
            if role == PlayersListModel.LegsWonRole:
                return item.legsWon
            if role == PlayersListModel.LegsLostRole:
                return item.legsLost
            if role == PlayersListModel.PointsDiffRole:
                return item.pointsDiff

    def rowCount(self, parent=QtCore.QModelIndex()):
        if parent.isValid():
            return 0
        return len(self._players)

    def roleNames(self):
        roles = {PlayersListModel.NameRole: b"name",
                 PlayersListModel.GamesWonRole: b"gwon",
                 PlayersListModel.GamesLostRole: b"glost",
                 PlayersListModel.LegsWonRole: b"lwon",
                 PlayersListModel.LegsLostRole: b"llost",
                 PlayersListModel.PointsDiffRole: b"pdiff"}
        return roles

    def setData(self, index, value, role=QtCore.Qt.DisplayRole):
        if role == QtCore.Qt.DisplayRole or role == QtCore.Qt.EditRole:
            if index.row() < 0 or index.row() >= len(self._players):
                return False

            self._players[index.row()] = value
            self.dataChanged.emit(index, index, [QtCore.Qt.EditRole | QtCore.Qt.DisplayRole])
            return True
        return False

    def setNewList(self, newList):
        self.beginResetModel()
        self._players = newList
        self.endResetModel()
