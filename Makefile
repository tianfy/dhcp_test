#################################################################
#################################################################
INSTALLDIR = $(ROMFSDIR)

RM	= rm -f

LIBS    += -L$(ROOTDIR)/user/libpcap-1.3.0/libpcap/ -lpcap
INCLUDE += -I$(ROOTDIR)/user/libpcap-1.3.0/libpcap/
INCLUDE += -I$(ROOTDIR)/user/libpcap-1.3.0/libpcap/pcap
CFLAGS  += -Wall $(INCLUDE)

DHCPTEST_BIN = dhcptest

DHCPTEST_OBJS = dhcp-client.o

all: $(DHCPTEST_BIN)

$(DHCPTEST_BIN): $(DHCPTEST_OBJS)
	$(CC) -o $(DHCPTEST_BIN) $(DHCPTEST_OBJS) $(CFLAGS) $(LIBS)

romfs:
	install -D dhcptest $(INSTALLDIR)/bin
	$(STRIP) $(INSTALLDIR)/bin/dhcptest

clean:
	$(RM) dhcptest *.o
