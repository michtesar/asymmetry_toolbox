## Frontal Alpha Asymmetry Toolbox
EEGLAB toolboox for computing frontal asymmetries with GUI

[![DOI](https://zenodo.org/badge/64396201.svg)](https://zenodo.org/badge/latestdoi/64396201)

<b>Michael Tesar</b><br>
National Institute of Mental Health in Prague <br>
<michael.tesar@nudz.cz> <br>
2016 Ceske Budejovice<br>

Open-source software under GPL-2 [licence](https://github.com/neuropacabra/asymmetry-toolbox/blob/master/LICENCE.md).

## More sources
More to read at my [blog](https://neurosciencemike.wordpress.com/2016/07/20/frontal-alpha-asymmetry-toolbox-for-eeglab/) or 
[youtube](https://www.youtube.com/embed/d6AwX5Jnsr0)

# How does it works?
## Prerequisites
Toolbox runs in MATLAB's EEGLAB software, which you can download here:
[https://sccn.ucsd.edu/eeglab/](https://sccn.ucsd.edu/eeglab/)

About adding the path into MATLAB for installing EEGLAB [more here](https://www.mathworks.com/matlabcentral/answers/112827-how-to-add-eeglab-toolbox-to-matlab-7-12-0)

## Install plugin
Download plugin from source here at GitHub. Unzip the latest version and copy it into your EEGLAB plugin folder. If you have already added a path into EEGLAB you are ready to go and Frontal Alpha Asymmetry Toolbox should work. If not please add your matlab into your path.

Another way is:
![https://github.com/neuropacabra/asymmetry-toolbox/blob/master/doc/installing.png?raw=true](https://github.com/neuropacabra/asymmetry-toolbox/blob/master/doc/installing.png?raw=true)

If you install plugin from EEGLAB official repository you have to correct installed data. For some reason plugin is placed into folder FAA1.0/faa which is wrong. To get this working you have to place all two .m files into FAA_v1.0 folder as described at picture below.

![https://github.com/neuropacabra/asymmetry-toolbox/blob/master/doc/plugin_install.png?raw=true](https://github.com/neuropacabra/asymmetry-toolbox/blob/master/doc/plugin_install.png?raw=true)

# Compute asymmetries
For FAA toolbox you have to have segmented data into same epochs. Each epoch type have to be in separate file and then you can compute average FAA idex for it. Then you will save it for futher analysis.
![https://github.com/neuropacabra/asymmetry-toolbox/blob/master/doc/faa_show.png?raw=true](https://github.com/neuropacabra/asymmetry-toolbox/blob/master/doc/faa_show.png?raw=true)

![https://github.com/neuropacabra/asymmetry-toolbox/blob/master/doc/channels.png?raw=true](https://github.com/neuropacabra/asymmetry-toolbox/blob/master/doc/channels.png?raw=true)

# How can you contribute?
It would need a bit help. So feel free to contribute (tweak the code and push it into the repository - this project is open source). Or you can simple write an email and I will be in touch with you.
