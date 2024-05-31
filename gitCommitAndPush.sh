
read -p "Do you commented the onetimeServices.ts file? (check it) (yes/no): " answer

if [ "$answer" == "yes" ]; then
	git add --all
	git commit -m "$1"
	git pull
	git push
else
  echo "Aborted."
fi
