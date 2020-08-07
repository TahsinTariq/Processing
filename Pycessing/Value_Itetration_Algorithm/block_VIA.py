class block:

    def __init__(self, val):
        self.val = val
        self.pval = self.val
        if isinstance(self.val, (int, float)):
            self.policy = "N"
        else:
            if val == "p":
                self.val = 1
                self.pval = 1
            elif val == "n":
                self.val = -1
                self.pval = -1
            elif val == "b":
                self.val = "b"
                self.pval = 0
        # self.actions
        # self.utility
        # self.rewards
