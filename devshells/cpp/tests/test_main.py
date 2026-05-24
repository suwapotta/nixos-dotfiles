#!/usr/bin/env python

import pytest
import subprocess
from pathlib import Path

# Absolute paths
TESTS_DIR = Path(__file__).parent
ROOT_DIR = TESTS_DIR.parent
BINARY_PATH = ROOT_DIR / "build" / "main"
TEST_DIRS = sorted([d for d in TESTS_DIR.iterdir() if d.is_dir() and d.name.startswith("test_")])

# pytest logic
@pytest.mark.parametrize("test_dir", TEST_DIRS, ids=[d.name for d in TEST_DIRS])
def test_cpp_simulation(test_dir: Path):
    expected_file = test_dir / "expected.txt"

    if not expected_file.exists():
        pytest.skip(f"Missing expected.txt in {test_dir.name}")

    result = subprocess.run(
        [str(BINARY_PATH), test_dir.name],
        capture_output=True,
        encoding="utf-8",
        text=True,
        timeout=5
    )

    assert result.returncode == 0, (
        f"C++ crashed (Code: {result.returncode})\n"
        f"STDOUT:\n{result.stdout}\n"
        f"STDERR:\n{result.stderr}"
    )

    with open(expected_file, "r", encoding="utf-8") as f:
        expected_output = f.read()

    assert result.stdout.strip() == expected_output.strip()
