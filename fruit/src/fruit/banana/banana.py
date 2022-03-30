from fruit.banana.peeler import Peeler


class Banana:
    def __init__(self, color: str):
        self.color = color
        self.peeler = Peeler()
        self.peeler.name = "Hehe"
