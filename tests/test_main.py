from src.main import main


def test_missing_args():
    result = main(["main.py"])
    assert(result == 1)


def test_with_correct_num_of_args():
    result = main(["main.py", "1"])
    assert(result == 0)
