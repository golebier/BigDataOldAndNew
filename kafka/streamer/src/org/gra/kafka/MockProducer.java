// TODO write in Scala too

package org.gra.kafka;

import .... /// add later

public class MockProducer {
    private static final Logger LOG = LoggerFactory.getLogger(MockProducer.class);
    
    private static void main(String[] args) {
        int responces = 99;
        String brokers = args[0];
        String topics = args[1];
        if (args.length >= 3) {
            responces = Integer.valueOf(args[2]);
        }
        Properties prop = prepaterProperties(brokers);
        KafkaProducer<byte[], byte[]> producer = new KafkaProducer<byte[], byte[]>(prop);
        
        // .... more ;)
    }
    public static Properties prepaterProperties(String broker) {
        ;
    }
};
