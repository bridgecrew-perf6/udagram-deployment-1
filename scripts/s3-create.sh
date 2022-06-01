# Check existance of .env file within root directory:
if [ -f "./../.env" ]; then
    # Use specific .env file for hidden variables:
    source "./../.env"
fi

# change directory to udagram-frontend/:
cd ../udagram-frontend/

# Check ENV variable:
if [[ "$ENV" == "dev" ]]; then
    # Get start datetime:
    start_time=`date +%s`
fi

# Display message before deploying:
echo $'\n==> Start creating script ...'

# Upload to S3:
echo $'==> Creating new bucket ...\n'
aws s3api create-bucket --bucket $AWS_BUCKET --region $AWS_REGION

# Set ACL to public-read-write:
echo $'\n==> Setting ACL to public-read-write ...'
aws s3api put-bucket-acl --bucket $AWS_BUCKET --acl public-read-write

# Allow public access:
echo "==> Allowing public access ..."
aws s3api put-public-access-block --bucket $AWS_BUCKET --public-access-block-configuration BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false

# Set bucket policy:
echo "==> Setting bucket policy ..."
aws s3api put-bucket-policy --bucket $AWS_BUCKET --policy file://bucket-policy.json

# Configure static website:
echo "==> Configuring static website ..."
aws s3api put-bucket-website --bucket $AWS_BUCKET --website-configuration file://bucket-website.json

# Display message after deploying:
echo "==> Finished creating script ..."

# Check ENV variable:
if [[ "$ENV" == "dev" ]]; then
    # Play a beep sound after finising:
    echo -en '\007'

    # Get end datetime:
    end_time=`date +%s`

    # Calculate runtime:
    echo "==> Execution runtime was `expr $end_time - $start_time` s."

    # Wait for any key to be pressed:
    read -p "==> Press any key to close the terminal ... " -n1 -s
fi
