#!/bin/bash

tmp="/root/date"
nmfl="$(basename "$0")"

function get_time() {
	curl -si "http://google.com" | grep Date > "$tmp"
	echo -e "${nmfl}: Mengambil waktu dari server Google."
	logger "${nmfl}: Mengambil waktu dari server Google."
}

function set_time() {
    hari=$(cat "$tmp" | cut -b 12-13)
    bulan=$(cat "$tmp" | cut -b 15-17)
    tahun=$(cat "$tmp" | cut -b 19-22)
    jam=$(cat "$tmp" | cut -b 24-25)
    menit=$(cat "$tmp" | cut -b 26-31)

    case $bulan in
        "Jan")
           bulan="01"
            ;;
        "Feb")
            bulan="02"
            ;;
        "Mar")
            bulan="03"
            ;;
        "Apr")
            bulan="04"
            ;;
        "May")
            bulan="05"
            ;;
        "Jun")
            bulan="06"
            ;;
        "Jul")
            bulan="07"
            ;;
        "Aug")
            bulan="08"
            ;;
        "Sep")
            bulan="09"
            ;;
        "Oct")
            bulan="10"
            ;;
        "Nov")
            bulan="11"
            ;;
        "Dec")
            bulan="12"
            ;;
        *)
           return

    esac

	date -u -s "$tahun"."$bulan"."$hari"-"$jam""$menit" > /dev/null 2>&1
	echo -e "${nmfl}: Menyetel waktu ke [ $(date) ]"
	logger "${nmfl}: Menyetel waktu ke [ $(date) ]"
}

# Runner
get_time
set_time
