from player import Player
from os import system
import time

board = [
    ['_', '_', '_'],
    ['_', '_', '_'],
    ['_', '_', '_']
]


def print_board():
    for row in board:
        for col in row:
            print(col, end=" ")
        print()
    print()


def parse_coords(line: str) -> tuple:
    if not ',' in line:
        raise ValueError("Invalid Coordinates")

    sp_str = line.split(",")
    x = int(sp_str[0])
    y = int(sp_str[1])

    return (x, y)


def validate_coords(coords: tuple) -> bool:
    valid_x: bool = coords[0] > 0 and coords[0] < 4
    valid_y: bool = coords[1] > 0 and coords[1] < 4
    return valid_x and valid_y


def print_player(current_player: Player):
    print(f"Player: {'X' if current_player == Player.X else 'O'}")


def main():
    current_player = Player.X

    while True:
        system("cls")
        print_board()
        print_player(current_player)
        line = input("Enter board coordinates as x,y: ")
        coords = None

        try:
            coords = parse_coords(line)
        except ValueError as ve:
            print(f"Invalid Coordinates: {line}")
            time.sleep(1)
            continue

        print(validate_coords(coords))

        if current_player == Player.X:
            current_player = Player.O
        else:
            current_player = Player.X


if __name__ == '__main__':
    main()
