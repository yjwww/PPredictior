import psycopg2

# PostgreSQL数据库连接参数
host = "192.168.1.232"
database = "imdb"
user = "gpadmin"
password = "gpadmin"

tpcdstables = ["catalog_sales", "catalog_returns", "store_sales", "store_returns", "web_sales", "web_returns", "inventory","call_center",
               "catalog_page","customer","customer_address","customer_demographics","date_dim","household_demographics","income_band",
               "item","promotion","reason","ship_mode","store","time_dim","warehouse","web_page","web_site","dbgen_version"]
imdbtables = ["aka_name","aka_title","cast_info","char_name","comp_cast_type","company_name","company_type","complete_cast","info_type",
              "keyword","kind_type","link_type","movie_companies","movie_info","movie_info_idx","movie_keyword","movie_link",
              "name","person_info","role_type","title"]


def getParatitionRecords():
    try:
        # 将数组保存到文件中
        with open("./data/query_result.txt", "w") as file:
            for table in imdbtables:
                connection = psycopg2.connect(
                    host=host,
                    database=database,
                    user=user,
                    password=password,
                    port=5435
                )

                # 创建游标对象
                cursor = connection.cursor()
                # 执行SQL查询
                sql_query = "select count(*) from "+table+" group by gp_segment_id order by gp_segment_id;"
                cursor.execute(sql_query)

                # 从游标中获取所有结果
                rows = cursor.fetchall()

                # 关闭游标和数据库连接
                cursor.close()
                connection.close()

                # 将查询结果保存到数组中
                result_array = []
                for row in rows:
                    result_array.append(row[0])


                file.write(str(result_array) + "\n")

                print("Query result saved to query_result.txt")

    except (Exception, psycopg2.Error) as error:
        print("Error while connecting to PostgreSQL:", error)
    finally:
        # 关闭数据库连接
        if connection:
            connection.close()


def getParameterValues(segmentID):
    try:
        connection = psycopg2.connect(
            host=host,
            database=database,
            user=user,
            password=password,
            port=5435
        )
        # 创建游标对象
        cursor = connection.cursor()
        # 执行SQL查询
        sql_query = "SELECT  content AS segment_id, name AS parameter_name, setting AS parameter_value " \
                    "FROM   gp_configuration " \
                    "WHERE content = "+ segmentID +" AND name " \
                    "IN ('shared_buffers', 'work_mem', 'gp_max_packet_size', 'max_connections', 'random_page_cost', 'seq_page_cost');"
        cursor.execute(sql_query)

        # 从游标中获取所有结果
        rows = cursor.fetchall()

        # 关闭游标和数据库连接
        cursor.close()
        connection.close()

        # 将查询结果保存到数组中
        result_array = []
        for row in rows:
            result_array.append(row[0])


        return result_array

    except (Exception, psycopg2.Error) as error:
        print("Error while connecting to PostgreSQL:", error)
    finally:
        # 关闭数据库连接
        if connection:
            connection.close()