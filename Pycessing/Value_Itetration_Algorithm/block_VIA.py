class block:
    def __init__(self, val):
        self.val = val
        self.pval = self.val
        if isinstance(self.val, (int, float)):
            self.policy = "N"
        # self.actions
        # self.utility
        # self.rewards
        
