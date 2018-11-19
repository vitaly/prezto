kaws() {
  local profile_prod=personalization@klarna-production
  local profile_non_prod=personalization@klarna-non-production
  case "$1" in
    env)
      if [ "$AWS_PROFILE" == "" ]; then
        echo "Please choose environment first. e.g. kaws prod" >&2
        return
      fi
      pyenv shell klarna
      aws-adfs-tool login -a ${AWS_PROFILE#*@} -r ${AWS_PROFILE%@*} | eval
      echo DONE
      ;;
    p*)
      echo switching to $profile_prod
      export AWS_PROFILE=$profile_prod
      ;;
    n*)
      echo switching to $profile_non_prod
      export AWS_PROFILE=$profile_non_prod
      ;;
    eu)
      echo switching to EU
      export AWS_DEFAULT_REGION=eu-west-1
      ;;
    us)
      echo switching to US
      export AWS_DEFAULT_REGION=us-east-1
      ;;
    *)
      cat <<_
Uasage:

  kaws prod             switch to production AWS profile
  kaws non-prod         switch to non-production AWS profile
_
  esac
}
