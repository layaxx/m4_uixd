library(ggplot2)
library(tidyr)

df <- data.frame(distance=            1:15,
                 wigle=           c(-37,-53,-52,-54,-56,-63,-56,-65,-65,-55,-64,-69,-66,-64,-61),
                 wifidata=        c(-44,-54,-56,-59,-58,-53,-59,-54,-63,-68,-63,-66,-61,-65,-69),
                 signalstrength=  c(-43,-48,-50,-50,-54,-57,-59,-55,-60,-62,-61,-63,-65,-66,-64)
                 )
df <- df %>% pivot_longer(cols=c('wigle', 'wifidata', 'signalstrength'),
                          names_to='app',
                          values_to='signal')


lbs <- c("wigle" = "WiGLE WiFi", "wifidata" = "WiFi Data", "signalstrength" = "Signal Strength")

ggplot(data=df, aes(x=distance, y=signal, group=app)) +
  geom_line(linetype = "dashed", aes(color=app))+
  geom_point(aes(color=app))+
  #geom_abline(slope = -1,intercept = -40)+
  scale_x_continuous(trans='log10')+
  facet_wrap(~app, ncol=1, labeller=as_labeller(lbs))+
  theme(legend.position="none")

