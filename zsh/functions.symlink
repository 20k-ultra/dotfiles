balena-login() {
    unset AWS_PROFILE
    docker run -it -v ~/.aws:/root/.aws cevoaustralia/aws-google-auth -p $1
    export AWS_PROFILE="$1"
}

balena-playground () {
    balena-login balena-playground 
}

balena-staging () {
    balena-login balena-staging 
    aws --profile balena-staging eks \
        --region us-east-1 update-kubeconfig \
        --name staging-eks \
        --alias staging-eks
}

balena-production () {
    balena-login balena-production 
    aws --profile balena-production eks \
        --region us-east-1 update-kubeconfig \
        --name production-eks \
        --alias production-eks
}
