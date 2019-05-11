#!/bin/bash
set -e
cd /opt/work
exec firebase deploy --token $fb_ci_token --project $fb_projectid --message "Release: $fb_releasemessage"