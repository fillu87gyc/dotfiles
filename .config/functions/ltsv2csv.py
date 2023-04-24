#! /bin/sh
# -*- coding: utf-8 -*-
""":" .

exec python "$0" ${1+"$@}
"""

import errno
import sys


def key(col):
    i = col.find(':')
    if i < 0:
        return None
    else:
        return col[:i]


def value(col):
    i = col.find(':')
    if i < 0:
        return None
    else:
        return col[i + 1:]


def key_value(col):
    i = col.find(':')
    if i < 0:
        return (None, None)
    else:
        return (col[:i], col[i + 1:])


def keys(cleanline):
    return [key(x) for x in cleanline.split('\t')]


def cleanup(line):
    if line.endswith('\r\n'):
        return line[:-2]
    if line.endswith('\n') or line.endswith('\r'):
        return line[:-1]
    return line


def allkeys(path):
    file = open(path, 'r')
    try:
        line = file.readline()
        titles = []
        while line:
            ts = keys(cleanup(line))
            for t in ts:
                if t not in titles:
                    titles.append(t)
            line = file.readline()
        return titles
    finally:
        file.close()


def quote(col):
    return '"' + col.replace('"', '""') + '"'


def escape(col):
    if '"' in col:
        return quote(col)
    if ',' in col:
        return quote(col)
    return col


def list_to_line(col_list):
    escaped = [escape(x) for x in col_list]
    return ','.join(escaped)


def row_to_line(titles, row):
    res = []
    for title in titles:
        if title in row:
            res.append(row[title])
        else:
            res.append('')
    return list_to_line(res)


def line_to_row(line):
    cleanline = cleanup(line)
    res = {}
    for col in cleanline.split('\t'):
        k, v = key_value(col)
        if k is not None:
            v = value(col)
            res[k] = v
    return res


def to_csv(inpath):
    titles = allkeys(inpath)
    with open(inpath, 'r') as i:
        try:
            sys.stdout.write(list_to_line(titles) + '\n')
            line = i.readline()
            while line:
                row = line_to_row(line)
                out = row_to_line(titles, row)
                sys.stdout.write(out + '\n')
                line = i.readline()
        except IOError as e:
            if e.errno == errno.EPIPE:
                return
            raise


if __name__ == '__main__':
    args = sys.argv
    if len(args) != 2:
        sys.stderr.write("Usage: %s </path/to/ltsv/file>" % args[0])
        sys.exit(101)
    to_csv(args[1])
