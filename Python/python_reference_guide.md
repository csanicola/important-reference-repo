# Python Reference Guide

_For all the miscellenous things and information about Python_

- for using `.ipynb` files and trying to import packages -> I use different python sources that are different from the repos the notebook is in to to avoid issues with installing packages, use this version instead:

  ```python
  import sys
  !{sys.executable} -m pip install jupyter beautifulsoup4 --upgrade # replace beautifulsoup4 with whatever package you are looking to install
  ```
