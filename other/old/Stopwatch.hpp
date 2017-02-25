/*
Stopwatch - High resolution timer api
Written in 2016 by Mykos Hudson-Crisp <micklionheart@gmail.com>
To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
*/
#pragma once

/* Example:
Stopwatch s;
// do stuff 1
double ProcessDuration1 = s.Lap();
// do stuff 2
double ProcessDuration2 = s.Lap();
*/

class Stopwatch {
public:
	Stopwatch() {
	#ifndef _WIN32
		clock_getres(CLOCK_MONOTONIC, &freq);
		scale = freq.tv_nsec / 1000000000.0;
	#else
		QueryPerformanceFrequency(&freq);
		scale = 1.0 / (double)freq.QuadPart;
	#endif
		Clear();
	}

	void Clear() {
	#ifndef _WIN32
		clock_gettime(CLOCK_MONOTONIC, &last);
	#else
		QueryPerformanceCounter(&last);
	#endif
	}

	double Lap() {
	#ifndef _WIN32
		timespec now;
		clock_gettime(CLOCK_MONOTONIC, &now);
		unsigned long long delta = (now.tv_sec - last.tv_sec) * 1000000000ULL;
		delta += now.tv_nsec - last.tv_nsec;
	#else
		LARGE_INTEGER now;
		QueryPerformanceCounter(&now);
		unsigned long long delta = now.QuadPart - last.QuadPart;
	#endif
		last = now;
		return scale * delta;
	}

private:
	double scale;
#ifndef _WIN32
	timespec freq, last;
#else
	LARGE_INTEGER freq, last;
#endif
};
