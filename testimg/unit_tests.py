import unittest
import script

class TestAllPairs(unittest.TestCase):

    def test_empty(self):
        self.assertEqual(script.all_pairs([]), [])

    def test_singleton(self):
        self.assertEqual(script.all_pairs([1]), [])

    def test_misc(self):
        self.assertEqual(script.all_pairs([1,2]), [(1,2)])
        self.assertEqual(script.all_pairs([1,2,3]), [(1, 2), (1, 3), (2, 3)])

if __name__ == '__main__':
    unittest.main()