ls -1 images3 > allImages3.txt
while IFS= read -r f <&3;
do
      #do something with "$f"
      ./runAdjusted.sh ./images3/$f | python extractToken.py | python howFrequent.py
done 3< allImages3.txt