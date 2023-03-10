waterReminder () {
  notify-send -i ~/.local/bin/waterIcon.png "Time to drink Water!!";
}

while true; do
  waterReminder;
  sleep 9000;
done
