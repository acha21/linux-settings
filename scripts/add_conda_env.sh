#!/usr/bin/zsh
# after activate the env_name conda env
# please use this script

env_name=$1
conda install jupyter notebook -y
conda install nb_conda -y
conda install ipykernel -y
python -m ipykernel install --user --name $env_name

