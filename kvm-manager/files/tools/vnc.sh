

○ → virsh domdisplay win-michael
vnc://127.0.0.1:0

○ → for dom in $(virsh list --name); do echo -n "$dom: "; virsh domdisplay $dom; done
win-michael-m: vnc://127.0.0.1:0


#Here's a one-liner to execute this for all running guests at once:

for i in $(virsh -q list|awk '{print $2}'|sort); do
  echo -e "\033[01;31m$i\033[00m -> $(virsh vncdisplay $i)"
done

#Also made it into a function that sorts output by port number:

function vnc-list
{
  for i in $(virsh -q list|awk '{print $2}'|sort); do
    PORTNUM=$(virsh vncdisplay $i|cut -f 2 -d ':')
    printf "% 2d: \033[01;32m%.20s\033[00m\n" "$PORTNUM" "$i";
  done | sort -n
}
