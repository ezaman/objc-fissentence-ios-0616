//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Ehsan Zaman on 6/13/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence  ()

@property (strong, nonatomic, readwrite) NSString *sentence;
-(void) assembleSentence;

//- (BOOL) validWord: (NSString*)word;
//
//- (BOOL)validPunctuation: (NSString*)punctuation;
//- (BOOL)validIndex:(NSUInteger)index;

@end



@implementation FISSentence


////PRIVATE
-(void) assembleSentence {
    self.sentence = [self.words componentsJoinedByString:@" "];
    self.sentence = [self.sentence stringByAppendingString:self.punctuation];
    
}

- (BOOL) validWord: (NSString*)word {
    if (word.length == 0 || [word isEqualToString: @" "] || [word isEqual:nil]) {
        return 0;
    }
    
    return 1;
}

- (BOOL)validPunctuation: (NSString*)punctuation {
    NSString *punc = @".,!?;:-";
    if (punctuation == nil || ![punc containsString:punctuation]){
        return 0;
    }
    return 1;
}
- (BOOL)validIndex:(NSUInteger)index {
    if (index >= self.words.count) {
        return 0;
    }
    return 1;
}


///PUBLIC
- (void) addWord: (NSString*) word {
    if ([self validWord:word]){
        [self.words addObject:word];
    }
    [self assembleSentence];
}

- (void) addWords:(NSArray*)words withPunctuation: (NSString*) punctuation {
    
    for (NSString *word in words){
        if ([self validWord:word]){
            [self.words addObject:word];
        }
    }
    if ([words isEqualToArray:@[]] || words.count == 0){
        return;
    }
    
    
    if(![self validPunctuation:punctuation]) {
        return; }
    
    self.punctuation = punctuation;
    [self assembleSentence];
}

- (void) removeWordAtIndex:(NSUInteger) index {
    
    if([self validIndex:index]){
        
        [self.words removeObjectAtIndex:index];
    }
    
    [self assembleSentence];
    
}
- (void) insertWord: (NSString*)word atIndex:(NSUInteger) index {
    if([self validIndex:index] && [self validWord:word]) {
    [self.words insertObject:word atIndex:index];
    }
    [self assembleSentence];
    
}
- (void) replacePunctuationWithPunctuation: (NSString*) punctuation{
    if ([self validPunctuation:punctuation]){
        self.punctuation = punctuation;
    }
    [self assembleSentence];
}
- (void) replaceWordAtIndex: (NSUInteger) index withWord: (NSString*) word {
    if ([self validIndex:index] && [self validWord:word]) {
        [self.words replaceObjectAtIndex:index withObject:word];
    }
    [self assembleSentence];
}


@end
