class block:

    def __init__(self, val):
        self.val = val
        self.pval = self.val
        self.isDigit = isinstance(self.val, (int, float))
        
        # self.actions = [UP, DOWN, LEFT, RIGHT]
        # self.utility
        # self.rewards
