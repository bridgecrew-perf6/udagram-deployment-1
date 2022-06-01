# Get start datetime:
start_time=`date +%s`

# Display message on deploy:
echo $'\n==> Start creating script ...'

# change directory to udagram-frontend/:
cd ../

# Upload to S3:
echo $'==> Creating new bucket ...\n'
aws s3api create-bucket --bucket mokhtar-udagram-bucket --region us-east-1

# Set ACL to public-read-write:
echo $'\n==> Setting ACL to public-read-write ...'
aws s3api put-bucket-acl --bucket mokhtar-udagram-bucket --acl public-read-write

# Allow public access:
echo "==> Allowing public access ..."
aws s3api put-public-access-block --bucket mokhtar-udagram-bucket --public-access-block-configuration BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false

# Set bucket policy:
echo "==> Setting bucket policy ..."
aws s3api put-bucket-policy --bucket mokhtar-udagram-bucket --policy file://bucket-policy.json

# Configure static website:
echo "==> Configuring static website ..."
aws s3api put-bucket-website --bucket mokhtar-udagram-bucket --website-configuration file://bucket-website.json

# Play a beep sound after finising:
echo "==> Finished creating script ..."
echo -en '\007'

# Get end datetime:
end_time=`date +%s`

# Calculate runtime:
echo "==> Execution runtime was `expr $end_time - $start_time` s."

# Wait for any key to be pressed:
read -p "==> Press any key to close the terminal ... " -n1 -s
