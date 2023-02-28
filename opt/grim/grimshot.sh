if ! command -v slurp &> /dev/null
then
    echo "warning: <slurp> could not be found"
fi


if ! command -v grim &> /dev/null
then
    echo "warning: <grim> could not be found"
    exit
fi


grim -g "$(slurp)" -l 7 -t png $1
