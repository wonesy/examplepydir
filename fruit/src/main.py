from fruit.apple import Apple


def run():
    apple = Apple()
    print(apple.name)
    print(apple.banana.peeler.name)


if __name__ == "__main__":
    run()
