How to chair a meeting
======================

Meetings are run using meetbot:
[quick reference](https://wiki.debian.org/MeetBot),
[manual](http://meetbot.debian.net/Manual.html),
[logs](http://meetbot.debian.net/debian-reproducible/).

Using meetbot requires no special permissions.

0. At the end of Meeting N-1,
the meeting summary and the date of Meeting N were posted,
and the pad for Meeting N was created.

2. Three days before the meeting, post a call for agenda items (to be added to the pad).

    Use the previous such email as a template.

3. One day before the meeting, post a date reminder.

    Use the previous such email as a template.

4. On meeting day, one hour before the meeting:

    - Post an IRC reminder.

    - Ensure meetbot is joined on the meeting channel.

    - Review the agenda and plan time.

5. At meeting time:

    - Call the meeting to order on the hour (sharp), using `#startmeeting`.

    - Call the topics off the agenda.

    - Have discussions that take too long
      move to the mailing list.

    - Use `#endmeeting` to terminate the meeting.

6. After the meeting:

    - Create the Meeting N+1 pad.

      Confirm the date of that meeting (default: two weeks after the meeting that just ended).

    - Post the meeting summary email to `rb-general@`.  

      Use the previous such email as a template.

    - Update the /topic of #reproducible-builds with the date of Meeting N+1.

    - Have somebody volunteer to chair Meeting N+1.

        - Point them to this file.
