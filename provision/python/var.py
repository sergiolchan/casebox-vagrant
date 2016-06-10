import sys, getopt, yaml


def main(argv):
    _file = ''
    _var = ''
    try:
        opts, args = getopt.getopt(argv, "f:v", ["file=", "var="])
    except getopt.GetoptError:
        print 'var.py -f <file> -v <variable>'
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print 'var.py -f <file>  -v <variable>'
            sys.exit()
        elif opt in ("-f", "--file"):
            _file = arg
        elif opt in ("-v", "--var"):
            _var = '{' + arg + '}'
    f = open(_file)
    data = yaml.load(f)
    print _var.format(data)

    f.close()


if __name__ == "__main__":
    main(sys.argv[1:])
