
extern void UnicowsReportFatalError(const char *msg);

void _alloca(void)
{
    UnicowsReportFatalError(
            "_alloca() called!\n"
            "Please report it at http://libunicows.sourceforge.net");
}
