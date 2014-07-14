## Standalone Dovecot IMAP

*Keep a local IMAP mirror, painlessly* 

Use the `sdimap` tool to set up a standalone Dovecot IMAP instance in seconds:

    mkdir mail-mirror
    cd mail-mirror
    sdimap init
    sdimap start

The new instance runs under your user account and keeps all of its files within
its instance directory (`mail-mirror` in the example).  By being self-contained,
it is trivial to place the instance directory inside an encrypted volume,
ensuring all your emails are encrypted.

Before you connect to the local IMAP mirror, you'll want to download all your
email from your server:

    sdsync mirror youruser@yourdomain.com yourserver.yourdomain.com

Replace `youruser@yourdomain.com` with your email account, and
`yourserver.yourdomain.com` with the hostname of the server that hosts your
email with Dovecot.

Now you're ready to connect to the local IMAP mirror with your mail client of
choice.  Instead of port `143`, use the output of `sdimap get port`:

    $ sdimap get port
    10143

For the username, specify the same email account you supplied to `sdsync`
(`youruser@yourdomain.com` in the example).

For the password, use the output of `sdimap get password`:

    $ sdimap get password
    4IpKjzZmu24Cq3wqpPo6jUYuQSVLoCJb

Now you can access all your mail locally.  Run `sdsync` at any time to pull
down the latest email to your local mirror.  If your mail server dies and has
to be rebuilt, run `sdync` to restore all your email back to the server.
