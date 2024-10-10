## Script to setup a conda environment with pytorch and other packages
## as per documentation in the Software_Installation_andConfiguration_Guide.pdf from Bill
source ~/.bashrc

#setup environment
conda create -n py39-pt python=3.9
conda activate py39-pt

#install packages
conda install pytorch torchvision -c pytorch 
conda install numpy pandas pyreadstat 
conda install geopandas pyproj rasterio shapely gdal 
conda install tensorboard tqdm 
conda install matplotlib seaborn bokeh pillow 
conda install scikit-learn umap-learn 
conda install ipykernel jupyter 
conda install glob 
conda install selenium 

pip install torchinfo torchmetrics torchgeo scikit-gstat
pip install pyreadstat

# Install the IPython kernel for the new environment
# Does not have the right permissions:
# python -m ipykernel install --name=py39-pt --display-name "Python (py39-pt)"

# sudo environment did not find python, hence the full path. Likely needs to change dependeing on environment
sudo /home/idmuser/miniconda3/envs/py39-pt/bin/python -m ipykernel install --name=py39-pt --display-name "Python (py39-pt)"

# Start Jupyter Notebook
jupyter notebook &
