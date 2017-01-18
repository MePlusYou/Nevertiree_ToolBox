# 分区表

```sql
create table sales(
    order_data DATETIME NOT NULL
    )
    ENGINE=InnoDB PARTITION BY RANGE(YEAR(order_data))
    (
        PARTITION p_2010 VALUES LESS THAN (2010),
        PARTITION p_2011 VALUES LESS THAN (2011),
        PARTITION p_2012 VALUES LESS THAN (2012),
        PARTITION p_catchall VALUES LESS THAN MAXVALUE
    );
```
