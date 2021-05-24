class SavedPlayer:
    def __init__(self, name, gamesWon=0, gamesLost=0, legsWon=0, legsLost=0, pointsDiff=0):
        self.pointsDiff = pointsDiff
        self.legsLost = legsLost
        self.legsWon = legsWon
        self.gamesLost = gamesLost
        self.gamesWon = gamesWon
        self.name = name
