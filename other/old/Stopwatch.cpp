/*
* GameGraph™ Middleware
* 
* Copyright © 2010 - 2016+, Mykos Hudson-Crisp <micklionheart@gmail.com>
* All rights reserved.
*
*/

//#include <GameGraph.h>
//using namespace GameGraph;

Stopwatch::Stopwatch() {
#ifndef _WIN32
	clock_getres(CLOCK_MONOTONIC, &freq);
	scale = freq.tv_nsec / 1000000000.0;
#else
	QueryPerformanceFrequency(&freq);
	scale = 1.0 / (double)freq.QuadPart;
#endif
	Clear();
}

void Stopwatch::Clear() {
#ifndef _WIN32
	clock_gettime(CLOCK_MONOTONIC, &last);
#else
	QueryPerformanceCounter(&last);
#endif
}

double Stopwatch::Lap() {
#ifndef _WIN32
	timespec now;
	clock_gettime(CLOCK_MONOTONIC, &now);
	u64 delta = (now.tv_sec - last.tv_sec) * 1000000000;
	delta += now.tv_nsec - last.tv_nsec;
#else
	LARGE_INTEGER now;
	QueryPerformanceCounter(&now);
	u64 delta = now.QuadPart - last.QuadPart;
#endif
	last = now;
	return scale * delta;
}

