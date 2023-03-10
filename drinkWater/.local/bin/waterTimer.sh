while true; do
  notify-send -i ~/.local/bin/waterIcon.png "Time to drink Water!!";
  if [[ $1 ]]; then
    echo "The Timer was set to $(($1/60)) min"
    sleep $1;
  else
    echo "No Timer set, using default 15 min";
    sleep 9000;
  fi
done
