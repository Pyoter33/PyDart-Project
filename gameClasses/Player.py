class Player:
    def __init__(self, mainScore=0):

        self.legsStack = []
        self.roundScoreStack = []
        self.mainScoreStack = []
        self.partialScoreStack = []
        self.currentPartialScore = 0
        self.allScoresSum = 0
        self.allScores = []
        self.partialScore = ['', '', '']
        self.average = -1.0
        self.legs = 0
        self.sets = 0
        self.doubles = 0
        self.triples = 0
        self.mainScore = mainScore
        self.roundScore = -1
        self.wonLegs = 0
