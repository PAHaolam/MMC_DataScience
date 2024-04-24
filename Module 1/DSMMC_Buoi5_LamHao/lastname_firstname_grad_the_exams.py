from numpy import mean, median

def task1():
    filename = input('Enter a class file to grade (i.e. class1 for class1.txt): ')
    try:
        with open(f'Data Files/{filename}.txt') as f:
            content = f.read()
        print(f"Successfully opened {filename}.txt\n")
        return content, filename
    except:
        print("File cannot be found\n")
        return None, filename



def invalid_line(line):
    elements = line.split(',')

    if(elements[0][0] != 'N' or not elements[0][1:].isdigit() or len(elements[0]) != 9):
        return 'Invalid line of data: N# is invalid:'
    
    if(len(elements) != 26):
        return 'Invalid line of data: does not contain exactly 26 values:'


def valid_analyze(lines):
    count_invalid = 0
    valid_lines = []

    for line in lines:
        check = invalid_line(line)
        if check is not None:
            print(f"{check}\n{line}\n")
            count_invalid += 1
        else:
            valid_lines.append(line)

    if not count_invalid: print("No errors found!\n")

    return valid_lines, count_invalid


def task2(content):
    lines = content.split('\n')

    print("**** ANALYZING ****\n")
    valid_lines, count_invalid = valid_analyze(lines)

    print("**** REPORT ****\n")
    print(f"Total valid lines of data: {len(lines) - count_invalid}")
    print(f"Total invalid lines of data: {count_invalid}\n")
    
    return valid_lines



def answer_scores(lines, answer_key):
    total = len(lines)
    scores = [0]*total
    ids = ['']*total
    skipped = [0]*25
    wrong = [0]*25

    for i, line in enumerate(lines):
        ids[i], *answer_check = line.split(',')
        for k in range(25):
            if(answer_check[k] == answer_key[k]): scores[i] += 4
            elif answer_check[k]: 
                scores[i] -= 1
                wrong[k] += 1
            else: skipped[k] += 1

    return ids, scores, skipped, wrong


def scores_analyze(scores):
    highscore = len([i for i in scores if i>80])
    print(f'Total student of high scores: {highscore}')

    meanscore = mean(scores)
    print('Mean (average) score: {:.2f}'.format(meanscore))

    highestscore = max(scores)
    print(f'Highest score: {highestscore}')

    lowestscore = min(scores)
    print(f'Lowest score: {lowestscore}')

    rangescore = highestscore - lowestscore
    print(f'Range of scores: {rangescore}')

    medianscore = int(median(scores))
    print(f'Median score: {medianscore}\n')


def skip_wrong_analyze(skipped, wrong, total):
    skipped_list = []
    skipped_max = 0
    for i, q in enumerate(skipped):
        if(q > skipped_max):
            skipped_max = q
            skipped_list = ['{} - {} - {:.2f}'.format(i+1, skipped_max, skipped_max / total)]
        elif(q == skipped_max):
            skipped_list.append('{} - {} - {:.2f}'.format(i+1, skipped_max, skipped_max / total))
    print(f"Question that most people skip: {' , '.join(skipped_list)}")

    wrong_list = []
    wrong_max = 0
    for i, q in enumerate(wrong):
        if(q > wrong_max):
            wrong_max = q
            wrong_list = ['{} - {} - {:.2f}'.format(i+1, wrong_max, wrong_max / total)]
        elif(q == wrong_max):
            wrong_list.append('{} - {} - {:.2f}'.format(i+1, wrong_max, wrong_max / total))
    print(f"Question that most people answer incorrectly: {' , '.join(wrong_list)}")


def task3(valid_lines):
    answer_key = "B,A,D,D,C,B,D,A,C,C,D,B,A,B,A,C,B,D,A,C,A,A,B,D,D"
    answer_key = answer_key.split(',')

    ids, scores, skipped, wrong = answer_scores(valid_lines, answer_key)
    scores_analyze(scores)
    skip_wrong_analyze(skipped, wrong, len(valid_lines))

    return ids, scores



def task4(ids, scores, filename):
    filename = f'Kết quả/{filename}_grades.txt'
    with open(filename, 'w') as f:
        for id, score in zip(ids, scores):
            f.write(f'{id},{score}\n')
            


def main():
    content, filename = task1()
    if content is not None:
        valid_lines = task2(content)
        ids, scores = task3(valid_lines)
        task4(ids, scores, filename)



main()
