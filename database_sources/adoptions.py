from random import randint, choice
from datetime import datetime, timedelta


def adoptions(adoption_id,member_id, emp_id,cat_ids,adoption_fee, adoption_date):
    with open('./data_files/adoptions.txt', 'w') as adopt:
        for i in range(150):
            print(i)
            entry = "INSERT INTO catcafe.dco.Adoptions VALUES({},{},{},{},{},'{}')\n".format(
            adoption_id[i],member_id[i],choice(emp_id),cat_ids[i],choice(adoption_fee),adoption_date[i]
            )
            adopt.write(entry)

def emp_schedule():
    barista = [110,130,150,220,230,240]
    tmp_id = [(i*10)+100 for i in range(15)]
    days = ['S','M','T','W','TH','F','S']
    with open("./data_files/schedule.txt", 'w') as sched:
        for i in tmp_id:
            emp_days = ''.join([choice(days) for j in range(5)]) # Note to self, this is wonky
            if i in barista:
                emp = [i,'Cafe', emp_days]
                sched.write(f"INSERT INTO catcafe.dco.Adoptions VALUES({i},'Cafe','{emp_days}')\n")
            else:
                sched.write(f"INSERT INTO catcafe.dco.Adoptions VALUES({i},'Adoptions','{emp_days}')\n")

if __name__=="__main__":
    cat_ids = [4097, 5755, 9633, 4701, 2195, 2939, 2148, 2449, 4549, 5260, 9104, 5152, 7721, 4841, 7366,
    7044, 2551, 9006, 5150, 8356, 5305, 920, 1862, 3513, 5725, 9166, 9489, 8874, 2996, 8025, 
    4791, 532, 1976, 9695, 3656, 2415, 6347, 893, 1565, 982, 2448, 9286, 4696, 3765, 6164, 
    8623, 8718, 4607, 8981, 4993, 8120, 5692, 7459, 7635, 5720, 1690, 4855, 4130, 7140, 
    5024, 5461, 6567, 6292, 7932, 8359, 2683, 9080, 8041, 7819, 3454, 5057, 2816, 7457, 
    5380, 5206, 4156, 380, 854, 8879, 1760, 6339, 7083, 5277, 9539, 4048, 1580, 7408, 
    4755, 7615, 3877, 3916, 3977, 9218, 9473, 5248, 4015, 4763, 768, 9551, 2639, 768, 
    425, 4284, 6613, 723, 5061, 6932, 1304, 5392, 4192, 245, 3425, 1439, 5525, 7681, 
    3595, 2251, 9875, 6799, 7194, 6016, 6398, 5268, 1881, 614, 7981, 2697, 1976, 4029, 
    9576, 997, 4080, 9173, 8136, 5259, 3628, 9048, 4631, 1089, 7531, 7883, 9775, 6870, 
    8106, 1463, 8917, 4732, 2793, 1867, 7831]

    member_id = [i+1000 for i in range(150)]
    adoption_id = [(i*randint(1,7))+10000 for i in range(150)]
    emp_id = [140,190,210]
    adoption_fee = [0,25,50,75,100,125,150,175]
    adoption_date = [
        (datetime.now() + timedelta(days=randint(-300,-5))).strftime('%Y-%m-%d') for i in range(150)
    ]

    print(adoption_id)
    adoptions(adoption_id,member_id, emp_id,cat_ids,adoption_fee, adoption_date)
    # emp_schedule()