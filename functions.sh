#!/bin/bash

pow() {
  echo $(($1 ** $2))
}

shortest() {
  # length of first argument
  len=$(echo ${@} | cut -d' ' -f1)
  result=()
  # iterate arguments
  for p in "${@}"; do
    # check element length
    if [ ${#p} -lt ${#len} ] || [ ${#p} -eq ${#len} ]; then
      # check element length
      if [ ${#p} -eq ${#len} ]; then
        # add element to the array
        result=(${result[@]} "${p}")
        # start next iteration
        continue
      fi
      # change minimum length
      len=${p}
      # add element to the array
      result=("${p}")
    fi

  done
  # output result element
  for e in ${result[@]}; do
    echo ${e}
  done
}

print_log() {
  # format date
  msg=${@}
  log_time=$(date '+%Y-%m-%d %H:%M')
  echo "[${log_time}] $msg"
}
