#!/bin/bash

# # Download/unzip labels
# d='./data' # unzip directory
# url=http://images.cocodataset.org/annotations/

# f='annotations_trainval2017.zip' # or 'coco2017labels.zip', 68 MB
# echo 'Downloading' $url$f ' ...'
# curl -L $url$f -o $f && unzip -q $f -d $d && rm $f & # download, unzip, remove in background

# # Download/unzip images
# d='./data' # unzip directory
# url=http://images.cocodataset.org/zips/
# # f1='train2017.zip' # 19G, 118k images
# f2='val2017.zip'   # 1G, 5k images
# # f3='test2017.zip'  # 7G, 41k images (optional)
# for f in $f2; do
#   echo 'Downloading' $url$f '...'
#   curl -L $url$f -o $f && unzip -q $f -d $d && rm $f & # download, unzip, remove in background
# done
# wait # finish background tasks


dataset="coco"
iters=2

if [ $dataset = "voc" ]
then
    data_dir="/data/voc2012/VOCdevkit/VOC2012/"
elif [ $dataset = "coco" ]
then
    data_dir="./data/"
fi


python train.py --use-cuda --iters ${iters} --dataset ${dataset} --data-dir ${data_dir}

