#!/data/data/com.termux/files/usr/bin/bash

: @params Author
: @params Config

class __animations__ && {
	{
		public: app =\> [ball_routing];
		public: app =\> [wave_ball];
		public: app =\> [spinner1];
		public: app =\> [bar];
		public: app =\> [clock];
		public: app =\> [small_big];
	}

	def: __animations__::ball_routing()
	{
		Named.argv "$2" ~\> [text]
		Named.argv "$1" ~\> [icon]

		# test = False
		#var:array \(frame '=>' \("\\${hi}•${st}•••","•${hi}•${st}••","••${hi}•${st}•","•••${hi}•${st}","••${hi}•${st}•","•${hi}•${st}••","${hi}•${st}•••"\)\)
		frame=(
			"${hi}•${st}•••"
			"•${hi}•${st}••"
			"••${hi}•${st}•"
			"•••${hi}•${st}"
			"••${hi}•${st}•"
			"•${hi}•${st}••"
			"${hi}•${st}•••"
		)
		for run_frame in ${frame[@]}; do
			tput sc
			io.write "\r${icon} ${text} ${run_frame}"
			tput rc
			sleep 0.1
		done;
	}

	def: __animations__::wave_ball()
	{
		{
			Named.argv "$1" ~\> [icon]
			Named.argv "$2" ~\> [text]
		};

		frame=(
			"${ij}0${hi}ooo"
			"o${me}0${hi}oo"
			"oo${cy}0${hi}o"
			"ooo${ku}0${st}"
			"oo${me}0${hi}o"
			"o${cy}0${hi}oo"
			"${ij}0${hi}ooo"
		);

		for abc in ${frame[@]}; do
			io.write "\r${icon} ${text} ${abc}"
			sleep 0.$(shuf -i 1-4 -n 1)
		done
	}

	def: __animations__::spinner1()
	{
		{
			Named.argv "$1" ~\> [icon]
			Named.argv "$2" ~\> [text]
		}

		frame=(
			"${ku}/"
			"${me}_"
			"${cy}\\"
			"${ij}|"
		)

		for runtime in ${frame[@]}; do
			tput sc
			printf "\r${icon} ${text} ${runtime}${st}"
			sleep 0.$(shuf -i 1-4 -n 1)
			tput rc
		done
	}

	def: __animations__::bar()
	{
		{
			minimist.argv ["$1"];: # icon
			minimist.argv ["$2"];: # text
			minimist.argv ["$3"];: # icon progress
			minimist.argv ["$4"];: # icon color
			minimist.argv ["$5"];: # count progress
		}

		let total_progress=(count_progress)

		for ((start = 0; start < total_progress; start++)); do {
			local bar_icon+="$icon_progress"
		}; done

		let length_bar=${#bar_icon}
		let runtime=0
		while ((runtime <= 100)); do
			let n=(runtime * length_bar / 100)
			printf "\r${ICON} ${TEXT} ${ku}[${st}${icon_colors}%-$((length_bar - 1))s${ku}]${st}" "${bar_icon:0:n}"
			((runtime += RANDOM % 5 + 2))
			sleep 0.$(shuf -i 1-5 -n 1)
		done
	}

	def: __animations__::clock()
	{
		{
			Named.argv "$1" ~\> [icon]
			Named.argv "$2" ~\> [text]
		}

		var frame : "🕛🕐🕑🕒🕓🕔🕕🕖🕗🕘🕙🕚"
		let total_range=${#frame}

		for ((start = 0; start < total_range; start++)); do {
			printf "%s %s [${frame:start:1}]" "$icon" "$text"
			sleep 0.$(shuf -i 1-5 -n 1)
		}; done
	}

	def: __animations__::small_big()
	{
		{
			# args definications
			# icon -> karakter
			# text -> capital
			minimist.argv ["$1"]
			minimist.argv ["$2"]
		}

		let range_text=${#TEXT}
		#var capital_leters : ${TEXT^^}
		for ((;start < range_text;)); do {
			tput sc
			echo -en "\r${ICON} ${TEXT:0:start}"$(tr a-z A-Z <<< "${TEXT:start:1}")"${TEXT:start+++1}"
			sleep 1
			tput rc
		}; done
	}
}; { const: __animations__ =\> animasi; }
