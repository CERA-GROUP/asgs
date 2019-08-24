#!/bin/bash
#----------------------------------------------------------------
# operator_defaults.sh : Functions required for initializing
# parameters that are Operator dependent.  
#----------------------------------------------------------------
# Copyright(C) 2019 Jason Fleming
#
# This file is part of the ADCIRC Surge Guidance System (ASGS).
#
# The ASGS is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# ASGS is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with the ASGS.  If not, see <http://www.gnu.org/licenses/>.
#----------------------------------------------------------------
THIS=config/operator_defaults.sh
operator=`who am i | awk '{print $1}'`
allMessage "$THIS: Setting default values for the Operator '${operator}'."
#
# set values based on Operator ... not basing this on $USER b/c on some platforms (e.g., hatteras)
# user name is ambiguous
case $operator in
   "jgflemin"|"ncfs")
      op="jgf"                      # initials as nickname for appending to asgs instance names
      # RMQ
      RMQMessaging_Enable="on"      #  enables message generation ("on" | "off")
      RMQMessaging_Transmit="on"    #  enables message transmission ("on" | "off")
      # email notifications
      NOTIFY_SCRIPT=corps_cyclone_notify.sh
      EMAILNOTIFY=yes         # no | yes to have host HPC platform email notifications
      ACTIVATE_LIST=null
      NEW_ADVISORY_LIST=null
      POST_INIT_LIST=null
      POST_LIST=null
      # opendap email notification
      OPENDAPNOTIFY="jason.g.fleming@gmail.com" # space delimited if a list
      #OPENDAPNOTIFY="asgs.cera.lsu@gmail.com jason.g.fleming@gmail.com" 
      # the following are related to job failure
      JOB_FAILED_LIST="jason.fleming@seahorsecoastal.com"
      NOTIFYUSER=jason.fleming@seahorsecoastal.com
      ASGSADMIN=jason.fleming@seahorsecoastal.com
      #
      # public keys:
      #
      # ncfs on hatteras
      ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA8kHpbs9pJuvd/hgPe5H21z3XcqlFgHVEFwlO/yveRFbORuy3A5N/+J9fwXIqUc5hZ/RV56WMAc9FuIAY/0HAiLmlItYCk5EQeoeIgmm9PTVAGxEtrcYfFlS2dHIqJ4LWs4vdBrFETa0G8GQ3Cwd3LtNnSj5AVjEccx/riNjjD0doNo8MbmyBODekTw1NcUDNlTnMFc4CHV1QloaFpG6pE7dZZMVZDgeF1zomqtBOGSiMpvoxOAwOvj67Q++fr3YbocxNNbo1aHSlBgekAKowxQQm6bMQVC22EzO2mzYOME6sjRwsdlW0yMuJA/ZU0ZmuQuQTZDfMk6Q7EMA1oPT/YQ== ncfs@ht4.renci.org

      ;;
   *)
      warn "cycle $CYCLE: $SCENARIO: $THIS: Operator $operator was not recognized."
      ;;
esac