#!/usr/bin/env bash

fd . src/ tests/ | entr -c bash -c "pytest"
