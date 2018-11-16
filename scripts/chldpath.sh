#!/bin/sh
echo "Target conda enviroment: $1 CUDA-dir : $2"
CONDA_ENV=$1
CUDA_DIR=$2

if [ -z $CONDA_ENV ] || [ -z $CUDA_DIR ]
then
    echo "Argument Error"
    echo "Usage: chldpath.sh CONDA_ENV_NAME CUDA_DIR_NAME"
    echo "Exiting..."
    exit 9999
fi

if [ ! -d "/home/acha21/anaconda3/envs/$CONDA_ENV" ] 
then
    echo "$CONDA_ENV DOES NOT exists." 
    echo "Exiting..."
    exit 9999 # die with error code 9999
fi

if [ ! -d "/usr/local/$CUDA_DIR" ] 
then
    echo "/usr/local/$CUDA_DIR DOES NOT exists." 
    echo "Exiting..."
    exit 9999 # die with error code 9999
fi



mkdir -p ~/anaconda3/envs/$CONDA_ENV/etc/conda/activate.d
touch ~/anaconda3/envs/$CONDA_ENV/etc/conda/activate.d/activate.sh
chmod +x ~/anaconda3/envs/$CONDA_ENV/etc/conda/activate.d/activate.sh


echo "
#!/bin/sh\nORIGINAL_PATH=\$PATH\nexport PATH=/usr/local/$CUDA_DIR/bin:/home/acha21/anaconda3/envs/$CONDA_ENV/bin:/home/acha21/acha21/.gem/ruby/2.3.0/bin:/home/acha21/anaconda3/bin:/home/acha21/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin\nORIGINAL_LD_LIBRARY_PATH=\$LD_LIBRARY_PATH\nexport LD_LIBRARY_PATH=/usr/local/$CUDA_DIR/lib64:/usr/local/$CUDA_DIR/extras/CUPTI/lib64:/usr/lib:/usr/local/lib\necho LD_LIBRARY_PATH=$LD_LIBRARY_PATH\necho 'PATH=$PATH'" > ~/anaconda3/envs/$CONDA_ENV/etc/conda/activate.d/activate.sh


mkdir -p ~/anaconda3/envs/$CONDA_ENV/etc/conda/deactivate.d
touch ~/anaconda3/envs/$CONDA_ENV/etc/conda/deactivate.d/deactivate.sh
chmod +x ~/anaconda3/envs/$CONDA_ENV/etc/conda/deactivate.d/deactivate.sh


echo "export LD_LIBRARY_PATH=\$ORIGINAL_LD_LIBRARY_PATH\nunset ORIGINAL_LD_LIBRARY_PATH\nexport PATH=\$ORIGINAL_PATH unset ORIGINAL_PATH" > ~/anaconda3/envs/$CONDA_ENV/etc/conda/deactivate.d/deactivate.sh

echo "\$LD_LIBRARY_PATH and \$PATH in $CONDA_ENV env have been changed to use $CUDA_DIR"
