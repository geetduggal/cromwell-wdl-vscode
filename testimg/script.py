import itertools
import sys

def all_pairs(items):
    return list(itertools.combinations(items, 2))

def main():
    items = [line.rstrip() for line in open(sys.argv[1])]
    for x in all_pairs(items):
        print("\t".join(x))

if __name__ == "__main__":
    main()