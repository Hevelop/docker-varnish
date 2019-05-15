CONNECTIONS_REMAINING=1
while [ $CONNECTIONS_REMAINING != 0 ]; do
    CONNECTIONS_REMAINING=`varnishstat -n /usr/local/var/varnish -1 | awk '/MEMPOOL.sess[0-9]+.live/ {a+=$2} END {print a}'`
    echo "$CONNECTIONS_REMAINING remaining, waiting..."
    sleep 1
done
killall varnishd