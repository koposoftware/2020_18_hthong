import cx_Oracle
import datetime
from ssml_builder.core import Speech

# 오라클 인스턴스 연결
cx_Oracle.init_oracle_client(lib_dir=r"C:\Users\HP\AppData\Local\Programs\Python\instantclient_19_8_x64")
# user, password, service
db = cx_Oracle.connect("system", "1234", "localhost:1521/xe")
# cursor 객체
cursor = db.cursor()
# 현재 날짜/시간 반환
now = datetime.datetime.now()
file_time = now.strftime("%m%d%Y")
month = now.strftime("%m")
day = now.strftime("%d")
today = month + "월 " + day + "일"

print(today)

# 1) DB member + account 정보를 가져온다

# 쿼리문
query = """ select id, a.acc_no, holder, money_to_living
		,(select sum(withdraw) from transaction 
		   where (trans_date between trunc(sysdate,'mm') and sysdate) and summary = '체크하나') as month_spending
		,money_to_living - (select sum(withdraw) from transaction 
			where (trans_date between trunc(sysdate,'mm') and sysdate) and summary = '체크하나') as remaining_budget
		,trunc((money_to_living - (select sum(withdraw) from transaction 
			where summary = '체크하나' and trans_date between trunc(sysdate,'mm') and sysdate)) / (last_day(sysdate) - sysdate + 1)) as rec_daily_budget
		,trunc((select sum(withdraw) from transaction where summary = '체크하나' and trans_date between trunc(sysdate,'mm') and sysdate) 
			/ trunc(sysdate - trunc(sysdate,'mm') + 1) * (select cast(to_char(last_day(sysdate), 'dd') as int) from dual) ) as estim_sum
        from onepick_autodebit a
        join account b
        on a.acc_no = b.acc_no """

# 결과값 가져오기
cursor.execute(query)
recs = cursor.fetchall()

# dic 객체에 넣어주기
i = 1
for rec in recs:

    # 1. 1개 행씩 가져오기
    row = dict(zip([d[0] for d in cursor.description], rec))
    print(row)

    # 2. 가져온 행으로 문장 완성(계좌, 이름, 생활비 설정액, 지출액, 잔액, 일예산, 얘상 지출액
    id = row['ID']
    acc_no = row['ACC_NO']
    name = row['HOLDER']
    living_budget = row['MONEY_TO_LIVING']
    spending = row['MONTH_SPENDING']
    remaining = row['REMAINING_BUDGET']
    daily_budget = row['REC_DAILY_BUDGET']
    es_sum = row['ESTIM_SUM']

    # 3. 발송할 문장을 만든다.
    message = name + ' 손님, ' + today + ' 데일리 금융리포트입니다.' + '남은 생활비 예산은 ' + str(
        remaining) + '원 입니다.' + '지금처럼 지출할 경우, 이번달 예상 지출액은 ' + str(es_sum) + '원 입니다.' + '이번달 목표 예산을 지키려면 하루에 ' + str(
        daily_budget) + '원을 사용해야 합니다.'
    print(message)

    # 자바 프로젝트 폴더로 음성 저장
    file_name = file_time + id + '.mp3'
    path = 'C:/Users/HP/texttospeech/pythonProject/text_save/'
    output = path + file_name

    # 4. 오디오로 변환
    def run_quickstart():
        from google.cloud import texttospeech

        # Instantiates a client
        client = texttospeech.TextToSpeechClient()

        sentence = message

        # Set the text input to be synthesized
        synthesis_input = texttospeech.SynthesisInput(text=sentence)

        # Build the voice request, select the language code ("en-US") and the ssml
        # voice gender ("neutral")
        voice = texttospeech.VoiceSelectionParams(
            # language_code="en-US"
            language_code="ko-KR"
            , ssml_gender=texttospeech.SsmlVoiceGender.NEUTRAL
        )

        # Select the type of audio file you want returned
        audio_config = texttospeech.AudioConfig(
            audio_encoding=texttospeech.AudioEncoding.MP3
        )

        # Perform the text-to-speech request on the text input with the selected
        # voice parameters and audio file type
        response = client.synthesize_speech(
            input=synthesis_input, voice=voice, audio_config=audio_config
        )

        # The response's audio_content is binary.
        with open(output, "wb") as out:
            # Write the response to the output file.
            out.write(response.audio_content)
            print('Audio content written to file' + output)
        # [END tts_quickstart]


    if __name__ == "__main__":
        run_quickstart()

    # 5. db에 파일경로 저장 --------------------------------
    
    #cursor2 
    cursor2 = db.cursor()

    query2 =""" insert into tts_file(acc_no, filename, path)
                values(:a, :b, :c) """
    
    cursor2.execute(query2, a= acc_no, b=file_name, c= path)
    

print("음성합성 함수 종료")

print(output)




# 커밋
db.commit()

# 커서 닫기
cursor.close()

# 디비 연결 해제
db.close()